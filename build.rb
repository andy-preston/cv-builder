# frozen_string_literal: true

require 'fileutils'

option = File.basename(ARGV[0], '.tex')

# invoke with a job type as argument
#     ruby2.5 build.ry php - with a job type
# or with the name of a covering letter
# where application-to-international-widgets.tex is a covering letter
# derived from template.tex
#     ruby2.5 build.ry application-to-international-widgets

template = "#{option}.tex"
if File.exist? template
    # If there is a job specific template it should assign jobType internally
    jobType = nil
else
    template = 'template.tex'
    jobType = {
        'php' => 'PHP',
        'js' => 'JS',
        'ruby' => 'Ruby'
    }.fetch option
end

latexCommand = "\\input{#{template}}"

unless jobType.nil?
    latexCommand =
        "\\newcommand{\\jobType}{#{jobType}}#{latexCommand}"
end

print "#{latexCommand}\n"

FileUtils.rm_f Dir.glob '*.pdf'
system "pdflatex --jobname=andy-preston-cv-#{option} \"#{latexCommand}\""

%w[aux out log].each do |suffix|
    FileUtils.rm_f Dir.glob "*#{suffix}"
end
