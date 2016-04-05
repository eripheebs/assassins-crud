require './app/models/assignment.rb'

describe Assignment do
  it 'should add a new assignment to the assignment table' do
    Assignment.create(assassin_id: 1, target_id: 2)
    expect(Assignment.first).not_to be(nil)
  end

end
