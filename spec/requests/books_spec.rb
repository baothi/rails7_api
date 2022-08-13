require 'rails_helper'

RSpec.describe "Books", type: :request do
  
  describe 'Book API' do
    # before do
    #   FactoryBot.create(:book, title: '1984', author: 'George Orwell')
    #   FactoryBot.create(:book, title: 'The time Machine', author: 'H.G Orwell')
    # end
    describe 'GET /books' do
      it "returns all books" do
        create_list :book, 2
        get '/api/v1/books'
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(2)
      end
    end
    
    describe 'POST /books' do
      # let!(:author) {create :author}
      it 'create a new book' do
        expect {
          post '/api/v1/books', params: { 
            book: {title: 'The Martian'},
            author: {first_name: 'Andy', last_name: 'Weir', age: '48'} 
          }
        }.to change { Book.count }.from(0).to(1)
        # debugger
        expect(response).to have_http_status(:created)
        expect(Author.count).to eq(1)
      end
    end
  
    describe 'DELETE /books/:id' do
      # let!(:book) { FactoryBot.create(:book, title: '1984', author: 'George Orwell') }
      let!(:book) {create :book}
  
      it 'deletes a book' do
        expect {
          delete "/api/v1/books/#{book.id}"
        }.to change { Book.count }.from(1).to(0)
  
        expect(response).to have_http_status(:no_content)
      end
    end

  end
end
