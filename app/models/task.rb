class Task < ActiveRecord::Base
  belongs_to :requester
  has_many :microtasks


  after_create :create_microtasks

  private
  def create_microtasks
    sent = self.content.split(".")
    if self.requester.credits >= self.budget
      sent.each do |s|
        a = self.microtasks.build(:original => s)
        a.save
      end
      self.requester.credits -= self.budget
      self.requester.save
    else
      
    end
  end


end
