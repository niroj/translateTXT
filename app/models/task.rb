class Task < ActiveRecord::Base
  belongs_to :requester
  has_many :microtasks


  after_create :create_microtasks

  private
  def create_microtasks
    sent = self.content.split(".")
    if self.requester.credits >= self.budget
      p = (self.budget - self.budget*0.2)/sent.size
      sent.each do |s|
        a = self.microtasks.build(:original => s, :price => p, :hit => true, :lang_from => self.lang_from, :lang_to => self.lang_to)
        a.save
      end
      self.requester.credits -= self.budget
      self.requester.save
    end
  end


end
