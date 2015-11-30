require 'xcodeproj'
  
project_dir = "#{ARGV[0]}/../.."
 
# Get .xcodeproj path
project_file = Dir.entries(project_dir).select {|f| f.end_with?(".xcodeproj") }.first
project_path = "#{project_dir}/#{project_file}"

if !project_path.nil? && File.exist?(project_path)
  # Open project
  begin
    project = Xcodeproj::Project.open(project_path)
  rescue
    puts "[JN] Can't open project file."
  end    
  
  unless project.nil?
    main_target = project.targets.first

    # Insert new build phase at beginning if not already present
    if main_target.shell_script_build_phases.any? {|p| p.name == "Jargon"}
      puts "[JN] Jargon build phase found."
    else
      if File.exist?('jargon')
        puts "[JN] Inserting Jargon build phase."
        phase = project.new(Xcodeproj::Project::Object::PBXShellScriptBuildPhase)
        phase.name = "Jargon"
        phase.shell_script = '"${PROJECT_DIR}/Pods/Jargon/jargon" sync -p "${PROJECT_DIR}"'
        main_target.build_phases.insert(0, phase)
        project.save() 
      else 
        puts "[JN] Can't find jargon binary. Please download the pod again."
        abort
      end
    end 

    # Add jargon file with project's base locale if not already present
    if project.files.any? {|f| f.display_name.end_with?(".jargon") unless f.display_name.nil? }
      puts "[JN] Jargon language file found."
    else
      # Figure out development locale  
      project_locales = project.root_object.known_regions
      if project_locales.count > 0
        languages = {"en" => "en_US", "fr" => "fr_FR", "de" => "de_DE", "zh-Hans" => "zh_Hans", "zh-Hant" => "zh_Hant", "ja" => "ja_JP", "nl" => "nl_NL", "it" => "it_IT", "es" => "es_ES", "ko" => "ko_KR", "pt" => "pt-BR", "pt-BR" => "pt_BR", "pt-PT" => "pt_PT", "da" => "da_DK", "fi" => "fi_FI", "nb" => "nb_NO", "sv" => "sv_SE", "ru" => "ru_RU", "pl" => "pl_PL", "tr" => "tr_TR", "uk" => "uk_UA", "ar" => "ar", "hr" => "hr_HR", "cs" => "cs_CZ", "el" => "el_GR", "he" => "he_IL", "ro" => "ro_RO", "sk" => "sk_SK", "th" => "th_TH", "id" => "id_ID", "ms" => "ms_Latn", "en-GB" => "en_GB", "ca" => "ca_ES", "hu" => "hu_HU", "vi" => "vi_VN"}
        project_locale = languages[project_locales[0]]
    
        # Find a good place for the file, with the Info.plist
        plist_file = project.files.select {|f| f.display_name.end_with?("Info.plist") unless f.display_name.nil? }.first
        plist_parent_group = plist_file.parent
    
        # Create file
        file_name = "#{project_locale}.base.jargon"
        puts "[JN] Creating #{file_name} in group #{plist_parent_group.name}."    
        File.new("#{plist_file.real_path.dirname}/#{file_name}", "w")    
        file = plist_parent_group.new_file(file_name)

        # Add the file to the main target
        main_target = project.targets.first
        main_target.add_resources([file])

        # Save the project file
        project.save()
      else
        puts "[JN] Can't figure out project development locale"
      end
    end
  end
else
  puts "[JN] No .xcodeproj found"
end