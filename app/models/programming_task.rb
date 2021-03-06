class ProgrammingTask < ActiveRecord::Base

	attr_accessible :name, :statement, :input_format, :time_limit, :memory_limit,
					:programming_language_ids, :programming_test_cases_attributes

	validates :name, presence: true
	validates :statement, presence: true
	validates :input_format, presence: true
	validates :time_limit, presence: true
	validates :memory_limit, presence: true

	validates :programming_language_ids, presence: true

	has_and_belongs_to_many :programming_languages, uniq: true, readonly: true
	has_many :programs, dependent: :destroy
	has_many :programming_test_cases, dependent: :destroy

	accepts_nested_attributes_for :programming_test_cases

end
