class Services::Ga::Tracker
  attr_reader :tracker

  class << self
    def page_view(path)
      tracker.pageview(path: path)
    end

    def event(category: nil, action: nil, label: nil, value: nil)
      tracker.event(category: category, action: action, label: label, value: value)
    end

    private

    def tracker
      @tracker ||= Staccato.tracker('UA-167845499-1', nil, ssl: true)
    end
  end
end
