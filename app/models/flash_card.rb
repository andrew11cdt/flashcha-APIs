class FlashCard < ApplicationRecord
  has_many :card_translations
  belongs_to :lesson
  class << self
  	def import_file
  		# spreadsheet = Roo::Excelx.new(file)
      data = Roo::Spreadsheet.open(Rails.root.join('app','assets','N1-N2-mimikara-goi-shinkanzen-bunpo.xlsx'), extension: :xlsx)
  	end
  end
end
 