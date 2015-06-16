module CarrierWave::LocalFileAssignable
  def makr_uploader_local_assignable(uploader_name)
    define_method :"#{uploader_name}_path=" do |local_path|
      send(:"#{uploader_name}=", File.open(local_path))
    end
  end
end
