require 'rails_helper'

RSpec.describe "Books", type: :request do

  
  describe 'Book API' do
    # after(:all) do
    #   DatabaseCleaner.clean_with(:truncation)
    # end
    let(:first_author) { FactoryBot.create(:author, first_name: 'George', last_name: 'Orwell', age: 46) }
    let(:second_author) { FactoryBot.create(:author, first_name: 'H.G', last_name: 'Wells', age: 78) }
    
    describe 'GET /books' do
      before do
         FactoryBot.create(:book, title: '1984', author: first_author)
         FactoryBot.create(:book, title: 'The Time Machine', author: second_author)
      end
      it "returns all books" do
        # create_list :book, 2
        get '/api/v1/books'
        expect(response).to have_http_status(:success)
        # expect(JSON.parse(response.body).size).to eq(2)
        expect(response_body.size).to eq(2)
        # debugger
        expect(response_body).to eq(
          [
            {
              'id' => 2,
              'title' => '1984',
              'author_name' => 'George Orwell',
              'author_age' => 46
            },
            {
              'id' => 3,
              'title' => 'The Time Machine',
              'author_name' => 'H.G Wells',
              'author_age' => 78
            }
          ]
        )
      end
      
      # spec it run ok
      it 'returns a subset of books based on limit' do
        get '/api/v1/books', params: { limit: 1 }
  
        expect(response).to have_http_status(:success)
        expect(response_body.size).to eq(1)
        expect(response_body).to eq(
          [
            {
              'id' => 4,
              'title' => '1984',
              'author_name' => 'George Orwell',
              'author_age' => 46
            }
          ]
        )
      end
      
      # spec it run ok
      it 'returns a subset of books based on limit and offset' do
        get '/api/v1/books', params: { limit: 1, offset: 1 }
  
        expect(response).to have_http_status(:success)
        expect(response_body.size).to eq(1)
        expect(response_body).to eq(
          [
            {
              'id' => 7,
              'title' => 'The Time Machine',
              'author_name' => 'H.G Wells',
              'author_age' => 78
            }
          ]
        )
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
        expect(response_body).to eq(
          {
            'id' => 8,
            'title' => 'The Martian',
            'author_name' => 'Andy Weir',
            'author_age' => 48
          }
        )
      end
    end
  
    describe 'DELETE /books/:id' do
      # let!(:book) { FactoryBot.create(:book, title: '1984', author: 'George Orwell') }
      let!(:book) { FactoryBot.create(:book, title: '1984', author: first_author) }
      DatabaseCleaner.clean_with(:truncation)
      # let!(:book) {create :book}
  
      it 'deletes a book' do
        # debugger
        expect {
          delete "/api/v1/books/#{book.id}"
        }.to change { Book.count }.from(1).to(0)
  
        expect(response).to have_http_status(:no_content)
      end
    end

  end
end
