module Backend::SponsorsHelper
  def options_for_sponsor_levels
    i = 0
    t('sponsor-levels').map do |l|
      i = i + 1
      [l, i]
    end
  end
end
