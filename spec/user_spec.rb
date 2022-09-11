require_relative '../models/init'

describe 'User' do
    describe 'when an user is submitted' do
        describe 'and it is valid' do
            it 'should add it correctly' do
                u = User.create(username: "jlennon", password: "yesterday", password_confirmation: "yesterday")
                expect(User.find_by(id: u.id).nil?).to eq(false)
            end
        end

        describe 'and the passwords dont match' do
            it 'shouldn\'t be added' do
                u = User.create(username: "jlennon", password: "yesterda", password_confirmation: "yesterday")
                expect(User.find_by(id: u.id).nil?).to eq(true)
            end
        end

        describe 'and the username already exists' do
            it 'shouldn\'t be added' do
                u = User.create(username: "jlennon", password: "yesterday", password_confirmation: "yesterday")
                w = User.new(username: "jlennon", password: "heyjude", password_confirmation: "heyjude")
                expect(w.save).to eq(false)
            end
        end

        describe 'and the password is empty' do
            it 'shouldn\'t be added' do
                u = User.new(username: "jlennon", password: '', password_confirmation: '')
                expect(u.save).to eq(false)
            end
        end

        describe 'and the password_confirmation is empty' do
            it 'shouldn\'t be added' do
                u = User.new(username: "jlennon", password: '1234', password_confirmation: '')
                expect(u.save).to eq(false)
            end
        end
        
        describe 'and the username is empty' do
            it 'shouldn\'t be added' do
                u = User.new(username: '', password: '1234', password_confirmation: '1234')
                expect(u.save).to eq(false)
            end
        end
    end
end