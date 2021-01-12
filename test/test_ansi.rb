# frozen_string_literal: true

require "helper"

class TestAnsi < JekyllUnitTest
  context nil do
    setup do
      @subject = Jekyll::Utils::Ansi
    end

    Jekyll::Utils::Ansi::COLORS.each_key do |color|
      should "respond_to? #{color}" do
        assert_respond_to(@subject, color)
      end
    end

    should "be able to strip colors" do
      assert_equal "hello", @subject.strip(@subject.yellow(@subject.red("hello")))
    end

    should "be able to detect colors" do
      assert @subject.has?(@subject.yellow("hello"))
    end
  end
end
