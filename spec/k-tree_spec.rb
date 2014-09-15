require_relative 'spec_helper'
require 'pp'

describe KTree do
  include KTree

  let(:ktree) do
    KTree.create do |node, vchildren|
      rand(3) != 55
    end
  end

  it "created a tree" do
    expect(ktree).to_not be_nil
  end

  it "has nodes" do
    expect(ktree.root).to_not be_nil
  end

  it "upper and lower coords are never equal" do
    ktree.each do |node|
      expect(node.upper).to_not eq node.lower
    end
  end
end
