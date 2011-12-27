class Task < ActiveRecord::Base
  belongs_to :requester
  has_many :microtasks

	validates :content, :length => { :minimum => 60 }
	validates :lang_from, :lang_to, :budget, :presence => true
	
  after_create :create_microtasks

  private
  def create_microtasks
    #sent = self.content.split(".")
    if self.requester.credits >= self.budget
      #p = (self.budget - self.budget*0.2)/sent.size
      #sent.each do |s|
       # a = self.microtasks.build(:original => s, :price => p, :hit => true, :lang_from => self.lang_from, :lang_to => self.lang_to)
       # a.save
     # end
      micro_task_builder
      self.requester.credits -= self.budget
      self.requester.save
    end
  end
  
  def micro_task_builder
  	total_words_array = self.content.split(" ")
  	total_words = total_words_array.size
  	sentences_array = self.content.split(".")
  	sentences = sentences_array.size
  	avg_word = total_words.to_f/sentences.to_f
  	limit = 60.to_f/avg_word
  	price_p_word = total_words.to_f/((self.budget.to_f - self.budget.to_f*0.2)*100)
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
  		elsif (total_counter.to_f <= (limit.floor*avg_word).floor && sent_counter == (sentences - 1) )
  			p = ((word_counter * price_p_word).round).to_i
  			a = self.microtasks.build(:original => temp_sent, :price => p, :hit => true, :lang_from => self.lang_from, :lang_to => self.lang_to)
        a.save
        temp_sent = nil
  			word_counter = 0
  		end
  		
  	end
  	
  	
  end


end
