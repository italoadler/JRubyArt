VERBOSE = true

if RUBY_PLATFORM == 'java'   # guard prevents issues with mri ruby when using creator
    working_directory = File.join(File.dirname(__FILE__))
    $LOAD_PATH << working_directory unless $LOAD_PATH.include?(working_directory)
    Dir[File.join(working_directory, '*.jar')].each do |jar|
        require jar
    end 
    Java::ProcessingFastmath::DeglutLibrary.new.load(JRuby.runtime, false)
    Java::ProcessingVecmathVec2::Vec2Library.new.load(JRuby.runtime, false)
    Java::ProcessingVecmathVec3::Vec3Library.new.load(JRuby.runtime, false)
    Java::ProcessingVecmathArcball::ArcballLibrary.new.load(JRuby.runtime, false)
    AppRender = Java::ProcessingVecmath::AppRender
    ShapeRender = Java::ProcessingVecmath::ShapeRender
    require 'jruby_art/app'
    require 'jruby_art/helper_methods'
end

require 'jruby_art/version'
require 'jruby_art/helpers/numeric'
# require 'jruby_art/helpers/string'
require 'jruby_art/helpers/range'
require 'jruby_art/runner'
