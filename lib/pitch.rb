# see:
#   https://computermusicresource.com/midikeys.html
#   https://en.wikipedia.org/wiki/Scientific_pitch_notation

class Pitch

  attr_accessor :semitone
  attr_accessor :octave

  SEMITONE_NAMES = %w[C C# D D# E F F# G G# A A# B]
  NUM_SEMITONES = SEMITONE_NAMES.count

  def self.new_from_midi(arg)
    case arg
    when Numeric
      new_from_midi_num(arg)
    when String
      new_from_midi_name(arg)
    else
      raise ArgumentError
    end
  end

  def self.new_from_midi_num(num)
    semitone, octave = SEMITONE_NAMES[num % NUM_SEMITONES], (num / NUM_SEMITONES)
    new(semitone, octave - 1)
  end

  def self.new_from_midi_name(name)
    semitone, octave = parse_name(name)
    new(semitone, octave + 1)
  end

  def self.new_from_spn(spn)
    semitone, octave = parse_name(spn)
    new(semitone, octave)
  end

  def self.parse_name(name)
    semitone_name, octave = name.match(/^(.*?)(-?\d+)$/).captures
    semitone = SEMITONE_NAMES.index(semitone_name)
    octave = octave.to_i
    [semitone, octave]
  end

  def initialize(semitone, octave)
    @semitone = case semitone
    when Numeric
      semitone
    when String
      SEMITONE_NAMES.index(semitone)
    else
      raise ArgumentError
    end
    @octave = octave
  end

  def ==(other)
    other &&
      @octave == other.octave &&
      @semitone == other.semitone
  end

  def to_midi_name
    to_s(offset: -1)
  end

  def to_midi_num
    ((@octave + 1) * NUM_SEMITONES) + @semitone
  end

  def to_spn
    to_s
  end

  def to_s(offset: 0)
    '%s%d' % [
      SEMITONE_NAMES[@semitone],
      @octave + offset,
    ]
  end

  def +(n)
    self.class.new_from_midi_num(to_midi_num + n)
  end

  def -(n)
    self + (-n)
  end

end