require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with a title, description, due_date and category" do
    task = Task.new(
      title: "Test task",
      description: "Test description",
      due_date: Date.today + 1,
      category: Category.new(name: "Test category", description: "Test description"),
      owner: User.new(email: "test@mail.com", password: "123456")
    )

    expect(task).to be_valid
  end
  it "is valid with a due date in the future"
  it "is invalid without a category"
  it "is invalid without a title" do
    task = Task.new(title: nil)
    task.valid?
    expect(task.errors[:title]).to include("can't be blank")
  end
  it "is invalid without a description"
  it "is invalid with a due date in the past"
  it "is invalid with a duplicate case sensitive title" do
    current_user = User.create(email: "test@mail.com", password: "123456")

    Task.create(
      title: "Test task",
      description: "Test description",
      due_date: Date.today + 1,
      category: Category.new(name: "Test category", description: "Test description"),
      owner: current_user
    )

    task = Task.new(
      title: "Test task",
      description: "Test description",
      due_date: Date.today + 1,
      category: Category.new(name: "Test category", description: "Test description"),
      owner: current_user
    )

    task.valid?
    expect(task.errors[:title]).to include("has already been taken")
  end
end
