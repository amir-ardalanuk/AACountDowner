Pod::Spec.new do |s|
          #1.
          s.name               = "AACountDowner"
          #2.
          s.version            = "1.1.0"
          #3.  
          s.summary         = "i hope can help you"
          #4.
          s.homepage        = "https://github.com/amir-ardalanuk/AACountDowner"
          #5.
          s.license              = "MIT"
          #6.
          s.author               = "Amir Ardalan"
          #7.
          s.platform            = :ios, "10.0"
          #8.
          s.source              = { :git => "https://github.com/amir-ardalanuk/AACountDowner.git", :tag => "1.1.0" }
          #9.
          s.source_files     =  'AACountDowner/*'
    end