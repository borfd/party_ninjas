class EventCalendarService
  attr_reader :events

  def initialize(events=Event.all)
    @events = events
  end

  def today
    on_day(Date.today)
  end

  def on_day(date)
    events.where(date: date)
  end

  def from(date)
    @events = events.where("date >= ?", date)
    self
  end

  def to(date)
    @events = events.where("date <= ?", date)
    self
  end

  def to_a
    @events.to_a
  end

  def size
    @events.size
  end

  def upcoming
    @events.where('date >= ?', Date.today).order(:date)
  end

  def each(&block)
    @events.each(&block)
  end

  def filter(filter)
    case filter.to_sym
    when :today
      today
    when :tomorrow
      on_day(Date.tomorrow)
    when :this_week
      from(Date.today).to(7.days.from_now)
    end
  end
end
