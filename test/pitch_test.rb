$VERBOSE = false

require 'minitest/autorun'
require 'minitest/power_assert'

require_relative '../lib/pitch'

class Pitch

  class Test < Minitest::Test

    def test_spn
      pitch = Pitch.new_from_spn('C4')
      assert { pitch.semitone == 0 }
      assert { pitch.octave == 4 }
      assert { pitch.to_spn == 'C4' }
    end

    def test_midi_num
      pitch = Pitch.new_from_midi(60)
      assert { pitch.semitone == 0 }
      assert { pitch.octave == 4 }
      assert { pitch.to_midi_num == 60 }
      assert { pitch.to_midi_name == 'C3' }
      assert { pitch.to_spn == 'C4' }
    end

    def test_midi_name
      pitch = Pitch.new_from_midi('C3')
      assert { pitch.semitone == 0 }
      assert { pitch.octave == 4 }
      assert { pitch.to_midi_num == 60 }
      assert { pitch.to_spn == 'C4' }
    end

    def test_increment
      pitch = Pitch.new_from_spn('C4')
      pitch += 1
      assert { pitch.to_spn == 'C#4' }
      pitch -= 12
      assert { pitch.to_spn == 'C#3' }
    end

    def test_equals
      pitch1 = Pitch.new_from_spn('C4')
      pitch2 = Pitch.new_from_midi('C3')
      assert { pitch1 == pitch2 }
    end

    OUTPUT_FILE = 'test/tmp/output.wav'

    def test_analyze
      File.unlink(OUTPUT_FILE) if File.exist?(OUTPUT_FILE)
      FileUtils.mkpath(File.dirname(OUTPUT_FILE))
      pitch = Pitch.new_from_spn('C4')
      pitch.write_to_file(OUTPUT_FILE)
      pitch2 = Pitch.read_from_file(OUTPUT_FILE)
      assert { pitch2 == pitch }
    end

  end

end