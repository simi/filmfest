# encoding: utf-8
module Refinery
  module Contest
    class Movie::Comment < Refinery::Core::BaseModel
      belongs_to :movie, :class_name => '::Refinery::Contest::Movie'

      validates :name, :presence => true
      validates :text, :presence => true
      validates :ip, :presence => true
      validates :movie_id, :presence => true, :numericality => true
      validate :no_spam_pls

      attr_accessor :hidden

      def no_spam_pls
        errors.add(:hidden, 'spam') unless self.hidden.empty?
      end
    end
  end
end
