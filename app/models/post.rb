class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: {
         maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "is not included in the list"}

    validate :clickbait_enough

def clickbait_enough
clickbait_name_formats = ["Won't Believe", "Secret", "Top", "Guess"]

clickbaity = clickbait_name_formats.map { |name| title && title.include?(name)
}

if !clickbaity.include?(true)
    errors.add(:title, "must be clickbait")
end


end



    # validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "Must be Fiction or Non-Fiction"}

    #this didn't work the way I wanted it to     
    # validate :category_must_be_fiction_or_non

    # def category_must_be_fiction_or_non
    #     unless category == "Fiction" || category == "Non-Fiction"
    #             errors.add(:category, "Must be Fiction or Non-Fiction")
    #     end
        
    #     # if category.present? && (category != "Fiction" || category != "Non-Fiction")
    #     #     errors.add(:category, "Must be Fiction or Non-Fiction")
    #     # end
    # end

end
