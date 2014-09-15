require_relative 'spec_helper'
require 'pp'

describe KTree do
  include KTree

  let(:ktree) do
    KTree.create(depth: 6) do |node, vchildren|
      node.refob = rand(4)
      node.refob != 0
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

  it "refob should be set to something" do
    ktree.each do |node|
      expect(node.refob).to_not be_nil
    end
  end
end
