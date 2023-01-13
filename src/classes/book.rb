require_relative './items'

class Book < Item
  attr_accessor :publisher, :cover_state, :title, :label

  # rubocop:disable Metrics/ParameterLists
  def initialize(title, date, publisher, cover_state, archived: false, id: nil)
    # rubocop:enable Metrics/ParameterLists
    super(id, date, archived: archived)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
