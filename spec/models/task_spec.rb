require 'spec_helper'

describe Task do
  before(:each) do
    @user = User.create(:login => 'username', :password => '123456', :password_confirmation => '123456')
    @todo_tasks = [
      Task.create(:title => 'Test', :description => 'Desc'),
      Task.create(:title => 'Test', :description => 'Desc'),
    ]
    @done_tasks = [
      Task.create(:title => 'Test', :description => 'Desc', :done => true),
      Task.create(:title => 'Test', :description => 'Desc', :done => true),
    ]
  end

  describe '#todo' do
    before(:each) do
      @tasks = Task.todo
    end

    it 'should return not done tasks' do
      @tasks.should == @todo_tasks
    end

    it 'should not return done tasks' do
      @tasks.should_not include(@done_tasks)
    end
  end

  describe '#done' do
    before(:each) do
      @tasks = Task.done
    end
    it 'should return done tasks' do
      @tasks.should == @done_tasks
    end

    it 'should not return not done tasks' do
      @tasks.should_not include(@todo_tasks)
    end
  end

  describe 'when created' do
    it 'should not be done' do
      task = Task.create(:title => 'Test', :description => 'Desc')
      task.should_not be_done
    end
  end
  describe 'done' do
    it 'should mark a task as done' do
      task = Task.create(:title => 'Test', :description => 'Desc')
      task.done!
      task.should be_done
    end
  end
end
