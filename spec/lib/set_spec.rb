require "binary_tree/set"

RSpec.describe BinaryTree::Set do
  subject { described_class.new(:test) }

  context 'instantiated with a value' do
    context 'looking up the first item' do
      it 'returns the item value' do
        expect(subject).to include(:test)
      end
    end

    context 'looking up a value not added' do
      it 'reports its absence' do
        expect(subject).to_not include(:missing)
      end
    end

    context 'after adding a value' do
      before do
        subject << :hello
      end

      it 'includes the value' do
        expect(subject).to include(:hello)
      end
    end

    context "using arbitrary object as value" do
      let(:key) { Object.new }
      before do
        subject << key
      end

      it 'includes the value' do
        expect(subject).to include(key)
      end
    end
  end

  context 'instantiated empty' do
    subject { described_class.new }

    context 'looking up a value not stored' do
      it 'reports its absence' do
        expect(subject).to_not include(:missing)
      end
    end

    context 'after adding a value' do
      before do
        subject << :hello
      end

      it 'includes the value' do
        expect(subject).to include(:hello)
      end
    end

    context "using arbitrary object as value" do
      let(:key) { Object.new }
      before do
        subject << key
      end

      it 'includes the value' do
        expect(subject).to include(key)
      end
    end
  end

  describe '#each' do
    subject { described_class.new }
    before do
      subject << :a
      subject << :b
      subject << :c
      subject << :d
    end

    it 'yields each item' do
      yielded_items = []
      subject.each { |i| yielded_items << i }
      expect(yielded_items).to match_array([:a, :b, :c, :d])
    end
  end
end
