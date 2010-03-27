class TootEverywhere
  def initialize(app)
    @app = app
  end

  def call(env)
    @env = env
    if i_should_toot?
      return a_big_toot
    end
    @app.call @env
  end

  private
  def i_should_toot?
    @env['PATH_INFO'] =~ /too+t/
  end

  def a_big_toot
    the_smelliest_part.with do |stinky|
      [
       200,
       { 'Content-type' => 'text/html'},
       <<-TOOT
<html><head><title>t#{stinky}t</title></head>
<body>
<h1 style="font-size: 20em;">t#{stinky}t</h1></body>
</html>
TOOT
      ]
    end
  end

  def the_smelliest_part
    (0..rand(100)).map do
      %w{ o O 0 }.with do |a|
        a[rand(a.length)]
      end
    end
  end
end

class Object
  def with
    yield(self)
  end
end
