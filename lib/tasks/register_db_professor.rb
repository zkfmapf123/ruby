def set_professor_save(args)
    
    if !!Professor.find_by_name(args[:p_name]) == true
        args[:p_name] = " " #공백처리
    end

    @p = Professor.new(
        name: args[:p_name],
        major: args[:p_major],
        image_url: args.fetch(:p_image_url,"professor.jpg"))

    @p.save
    #valid
end