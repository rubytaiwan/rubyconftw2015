module StaticPagesHelper
  def image_retina_tag(name_at_1x, **options)
    name_at_2x = name_at_1x.gsub(%r{\.\w+$}, '@2x\0')
    image_tag(name_at_1x, options.merge("data-at2x" => asset_path(name_at_2x)))
  end

  def session_schedule(handle)
    spk = @speakers.find{|s| s.dom_id == handle}
    if spk.present?
      speaker_schedule spk
    else
      raw '&nbsp;'
    end
  end

  def speaker_schedule(spk)
    block = link_to "#{spk.name}：#{spk.subject} (#{spk.english ? 'English' : 'Chinese'})", "##{spk.dom_id}", class: 'link-to-speaker'
    if spk.slide_url.present? || spk.video_url.present?
      block << " ("
      block << link_to('Slide', spk.slide_url, class: 'url-colored', target: '_blank') if spk.slide_url.present?
      if spk.slide_url.present? && spk.video_url.present?
        block << ", "
      end
      block << link_to('Video', spk.video_url, class: 'url-colored', target: '_blank') if spk.video_url.present?
      block << ")"
    end
    return block
  end

end
