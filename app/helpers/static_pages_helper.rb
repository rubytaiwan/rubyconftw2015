module StaticPagesHelper
  def image_retina_tag(name_at_1x, **options)
    name_at_2x = name_at_1x.gsub(%r{\.\w+$}, '@2x\0')
    image_tag(name_at_1x, options.merge("data-at2x" => asset_path(name_at_2x)))
  end

  def session_schedule(handle)
    spk = @speakers.find{|s| s.dom_id == handle}
    if spk.present?
      link_to "#{spk.name}：#{spk.subject} (#{spk.english ? 'English' : 'Chinese'})", "##{spk.dom_id}", class: 'link-to-speaker'
    else
      raw('TBA')
    end
  end

end
