# frozen_string_literal: true

module DateSelectHelper
  def select_date(date, from:)
    select date.year.to_s, from: "#{from}_1i"
    select date.strftime('%B'), from: "#{from}_2i"
    select date.day.to_s, from: "#{from}_3i"
  end

  def assert_date(date, from:)
    assert_equal  date.year.to_s, find("select##{from}_1i").value
    assert_equal  date.month.to_s, find("select##{from}_2i").value
    assert_equal  date.day.to_s, find("select##{from}_3i").value
  end
end
