module ThinkingSphinx::Core::Settings
  protected

  # Return config settigns or delta ones
  #
  def current_settings
    return config.settings unless respond_to?(:delta?) && delta?
    config.settings.merge(config.delta_settings)
  end

  private

  def apply_defaults!(defaults = self.class.settings)
    defaults.each do |setting|
      value = current_settings[setting.to_s]
      send("#{setting}=", value) unless value.nil?
    end
  end
end
