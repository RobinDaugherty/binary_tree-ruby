require "binary_tree/hash"

RSpec.describe BinaryTree::Hash do
  subject { described_class.new(:test, 100) }

  describe '#fetch' do
    context 'with an existing key' do
      it 'returns the item value' do
        expect(subject.fetch(:test)).to eq(100)
      end
    end
    context 'when a default value is specified' do
      context 'and an existing key' do
        it 'returns the item value' do
          expect(subject.fetch(:test, 101)).to eq(100)
        end
      end
      context 'and a key not matching a value' do
        it 'returns the default value' do
          expect(subject.fetch(:missing, 101)).to eq(101)
        end
      end
      context 'when a block is passed' do
        context 'and a key not matching a value' do
          it 'returns the default value' do
            expect(subject.fetch(:missing, 101) { 102 }).to eq(101)
          end
        end
      end
    end
    context 'when no default value is specified' do
      context 'and an existing key' do
        it 'returns the item value' do
          expect(subject.fetch(:test)).to eq(100)
        end
      end
      context 'and a key not matching a value' do
        it 'raises an error' do
          expect { subject.fetch(:missing) }.to raise_error(KeyError)
        end
      end
      context 'when a block is passed' do
        context 'and a key not matching a value' do
          it 'returns the result of the block' do
            expect(subject.fetch(:missing) { 102 }).to eq(102)
          end
        end
      end
    end
  end

  context 'instantiated with a block' do
    subject {
      described_class.new(:test, :existing_value) { |hash, key| hash[key] = :default_val }
    }

    it 'uses the block to provide the default value' do
      expect(subject[:empty]).to eq(:default_val)
    end
  end

  context 'instantiated with an item' do
    context 'looking up the first item' do
      it 'returns the item value' do
        expect(subject[:test]).to eq(100)
      end
    end

    context 'looking up an item not stored' do
      it 'returns nil' do
        expect(subject[:missing]).to be_nil
      end
    end

    context 'adding a value' do
      before do
        subject[:hello] = 200
      end

      it 'returns the item value' do
        expect(subject[:hello]).to eq(200)
      end
    end

    context 'adding a bunch of values' do
      before do
        subject[:a] = 1
        subject[:b] = 2
        subject[:c] = 3
        subject[:d] = 4
      end

      it 'returns the items' do
        expect(subject[:a]).to eq(1)
        expect(subject[:b]).to eq(2)
        expect(subject[:c]).to eq(3)
        expect(subject[:d]).to eq(4)
      end
    end

    context 'updating a value' do
      before do
        subject[:test] = 101
      end

      it 'returns the item value' do
        expect(subject[:test]).to eq(101)
      end
    end

    context "using arbitrary objects as keys" do
      let(:key) { Object.new }
      before do
        subject[key] = 1001
      end

      it 'returns the item value' do
        expect(subject[key]).to eq(1001)
      end
    end

    context 'storing a hash as a value' do
      let(:other_hash) { described_class.new(:world, 102) }

      before do
        subject[:hello] = other_hash
      end

      it 'returns the item value' do
        expect(subject[:hello][:world]).to eq(102)
      end
    end
  end

  context 'instantiated empty' do
    subject { described_class.new }

    context 'looking up an item not stored' do
      it 'returns nil' do
        expect(subject[:missing]).to be_nil
      end
    end

    context 'adding a value' do
      before do
        subject[:hello] = 200
      end

      it 'returns the item value' do
        expect(subject[:hello]).to eq(200)
      end
    end

    context 'updating a value' do
      before do
        subject[:test] = 101
      end

      it 'returns the item value' do
        expect(subject[:test]).to eq(101)
      end
    end

    context "using arbitrary objects as keys" do
      let(:key) { Object.new }
      before do
        subject[key] = 1001
      end

      it 'returns the item value' do
        expect(subject[key]).to eq(1001)
      end
    end

    context 'storing a hash as a value' do
      let(:other_hash) { described_class.new(:world, 102) }

      before do
        subject[:hello] = other_hash
      end

      it 'returns the item value' do
        expect(subject[:hello][:world]).to eq(102)
      end
    end
  end
end
