require 'spec_helper'
require_relative '../lib/bitmap_editor'

describe BitmapEditor do
  shared_examples :bitmap_editor do |params|
    let(:test_bitmap)       { 'spec/tmp/bitmap' }
    let(:commands_filename) { "spec/fixtures/command_files/#{params.fetch(:commands_filename)}" }

    before do
      allow(BitmapReader).to receive(:filename).and_return(test_bitmap)
      allow(BitmapWriter).to receive(:filename).and_return(test_bitmap)
    end

    if params.fetch(:success)
      context 'success' do
        let(:pixels)   { Marshal.load(Base64.decode64(File.open(test_bitmap, 'r') { |f| f.read })) }

        before do
          subject.run(commands_filename)
        end

        after do
          File.delete(test_bitmap)
        end

        it 'updates bitmap' do
          expect(pixels).to eq params.fetch(:expected_result)
        end
      end
    else
      context 'failure' do
        it 'raises error' do
          expect { subject.run(commands_filename) }.to raise_error ArgumentError, params.fetch(:expected_error_message)
        end
      end
    end
  end

  context 'example_1.txt' do
    expected_result =
      [
        %w( O O O O O ),
        %w( O O Z Z Z ),
        %w( A W O O O ),
        %w( O W O O O ),
        %w( O W O O O ),
        %w( O W O O O )
      ]

    it_behaves_like :bitmap_editor, commands_filename: 'example_1.txt', success: true, expected_result: expected_result
  end

  context 'example_2.txt' do
    expected_result =
      [
        %w( O O O O O ),
        %w( Z Z Z Z Z ),
        %w( O W O T O ),
        %w( O W O O O ),
        %w( O W O O O ),
        %w( O W O O O )
      ]

    it_behaves_like :bitmap_editor, commands_filename: 'example_2.txt', success: true, expected_result: expected_result
  end

  context 'Empty command file' do
    it_behaves_like :bitmap_editor, commands_filename: 'example_3.txt', success: true, expected_result: nil
  end

  context 'Too large row count' do
    error_message = 'Maximum allowed size is 250 x 250'
    it_behaves_like :bitmap_editor, commands_filename: 'example_4.txt', success: false, expected_error_message: error_message
  end

  context 'Unrecognised command' do
    error_message = 'Unrecognised command IP'
    it_behaves_like :bitmap_editor, commands_filename: 'example_5.txt', success: false, expected_error_message: error_message
  end

  context 'No command file' do
    error_message = 'Please provide correct file'
    it_behaves_like :bitmap_editor, commands_filename: 'no_file', success: false, expected_error_message: error_message
  end

  context 'Missed arguments for I command' do
    error_message = 'Commands::I: 2 arguments required: M N'
    it_behaves_like :bitmap_editor, commands_filename: 'example_6.txt', success: false, expected_error_message: error_message
  end
end
