class Task < ActiveRecord::Base
  belongs_to :requester
  has_many :microtasks

	validates :content, :length => { :minimum => 60 }
	validates :lang_from, :lang_to, :budget, :presence => true
	
  before_save :default_values
  after_create :create_microtasks

  private
  def create_microtasks
    if self.requester.credits >= self.budget
      micro_task_builder
      self.requester.credits -= self.budget
      self.requester.save
    end
  end
  
  def default_values
    self.status = "incomplete" unless self.status
  end
  
  def micro_task_builder
  	total_words_array = self.content.split(" ")
  	total_words = total_words_array.size
  	sentences_array = self.content.split(".")
  	sentences = sentences_array.size
  	avg_word = total_words.to_f/sentences.to_f
  	limit = 60.to_f/avg_word
  	price_p_word = ((self.budget.to_f - self.budget.to_f*0.2)/total_words.to_f)
  	word_counter = 0
  	total_counter = total_words
  	sent_counter =  0
  	temp_sent = nil
  	sentences_array.each do |s|
  		sent_counter += 1
  		sentences_word = s.split(" ")
  		sent_word = sentences_word.size
  		word_counter += sent_word
  		total_counter = total_counter - sent_word
  		temp_sent = (temp_sent + s.to_s + "." ) if not temp_sent.nil?
  		temp_sent = ( s.to_s + ".") if temp_sent.nil?
  		if ( word_counter.to_f >= (limit.floor*avg_word).floor && word_counter.to_f <= (limit.ceil*avg_word).ceil )
  			p = ((word_counter * price_p_word).round).to_i
  			a = self.microtasks.build(:original => temp_sent, :price => p, :hit => true, :lang_from => self.lang_from, :lang_to => self.lang_to)
        a.save
  			temp_sent = nil
  			word_counter = 0
  		elsif (word_counter.to_f > (limit.ceil*avg_word).ceil)
  		  p = ((word_counter * price_p_word).round).to_i
  		  a = self.microtasks.build(:original => temp_sent, :price => p, :hit => true, :lang_from => self.lang_from, :lang_to => self.lang_to)
        a.save
  			temp_sent = nil
  			word_counter = 0  
  		elsif (total_counter.to_f <= (limit.floor*avg_word).floor && sent_counter == (sentences) )
  			p = ((word_counter * price_p_word).round).to_i
  			a = self.microtasks.build(:original => temp_sent, :price => p, :hit => true, :lang_from => self.lang_from, :lang_to => self.lang_to)
        a.save
        temp_sent = nil
  			word_counter = 0
  		end
  		
  	end
  	
  	
  end


end
