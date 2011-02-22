class Notifier < ActionMailer::Base
  uri = URI.parse(LibraryGroup.site_config.url)
  default_url_options[:host] = uri.host
  default_url_options[:port] = uri.port if uri.port != 80

  def message_notification(user)
    from = "#{LibraryGroup.site_config.display_name.localize} <#{LibraryGroup.site_config.email}>"
    subject = I18n.t('message.new_message_from_library', :library => LibraryGroup.site_config.display_name.localize)
    @user = user
    mail(:from => from, :to => user.email, :subject => subject)
  end

  def manifestation_info(user, manifestation)
    from = "#{LibraryGroup.site_config.display_name.localize} <#{LibraryGroup.site_config.email}>"
    subject = "#{manifestation.original_title} : #{LibraryGroup.site_config.display_name.localize}"
    @user = user
    @manifestation = manifestation
    mail(:from => from, :to => user.email, :subject => subject)
  end

end
