module Api
  module V1
    class BooksController < ApplicationController
      def index
        books = Book.all
        render json: BooksRepresenter.new(books).as_json
      end

      def create
        # binding.irb
        author = Author.find_or_create_by(author_params)
        book = Book.new(book_params.merge(author_id: author.id))

        if book.save
          render json: book, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Book.find(params[:id]).destroy!

        head :no_content
      end

      private

      def author_params
        params.require(:author).permit(:first_name, :last_name, :age)
      end

      def book_params
        params.require(:book).permit(:title)
      end
    end
  end
end

# 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
# rails g migration add_author_to_books author:references
# Book.select {|book| book.author_id.nil?}.map(&:destroy!)