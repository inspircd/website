require "yaml"

def check_section(hash, sections)
    sections.each do |section, type|
        fail "Network list is missing the #{section} section" unless hash.include?(section)
        fail "The #{section} section is not a #{type}" unless hash[section].is_a?(type)
        fail "The #{section} section is empty" if hash[section].respond_to?(:empty?) && hash[section].empty?
    end
end

networks = YAML.load_file(File.join(__dir__, "..", "_data", "networks.yml"))
fail "Network list is not an array" unless networks.is_a?(Array)

previous_network = nil
networks.each do |network|
    check_section(network, {
        "name"        => String,
        "contact"     => String,
        "description" => String,
        "server"      => Hash,
        "url"         => String,
    })

    check_section(network["server"], {
        "host" => String,
        "port" => Integer,
        "chan" => String,
    })

    this_network = network["name"].downcase
    fail "Network list is not sorted alphabetically" if previous_network && previous_network > this_network
    previous_network = this_network
end
