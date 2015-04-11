require './test/test_helper'
require './test/create_sources_and_payloads'

class SourceTest < Minitest::Test
  include CreateSourcesAndPayloads

  def test_source_has_payloads
    source = TrafficSpy::Source.create(identifier: "something", root_url: "http://example.com")
    assert_equal [], source.payloads
  end

  def test_it_can_return_urls_for_source
    source = CreateSourcesAndPayloads.create_source("jumpstartlab", "http://www.jumpstartlab.com")
    CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/blog",
                                            "2014-02-16 21:38:28 -0700",
                                            37,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.211",
                                            source)
    CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/courses",
                                            "2014-03-13 21:38:30 -0700",
                                            37,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.211",
                                            source)
    CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/courses",
                                            "2015-03-12 21:38:00 -0800",
                                            37,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.210",
                                            source)

    CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/courses",
                                            "2015-03-10 21:38:05 -0800",
                                            37,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.210",
                                            source)

    CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/home",
                                            "2015-03-09 22:28:00 -0800",
                                            37,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.210",
                                            source)

    CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/home",
                                            "2015-03-08 19:28:00 -0800",
                                            37,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.210",
                                            source)

  urls = ["http://jumpstartlab.com/blog", "http://jumpstartlab.com/courses", "http://jumpstartlab.com/courses", "http://jumpstartlab.com/courses", "http://jumpstartlab.com/home", "http://jumpstartlab.com/home"]    
  assert_equal urls, source.urls
  assert_equal ["http://jumpstartlab.com/courses", "http://jumpstartlab.com/home", "http://jumpstartlab.com/blog"], source.ordered_urls
  end

  def test_it_can_return_browsers_for_source
    source = CreateSourcesAndPayloads.create_source("jumpstartlab", "http://www.jumpstartlab.com")
    CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/blog",
                                            "2014-02-16 21:38:28 -0700",
                                            37,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.211",
                                            source)
    CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/courses",
                                            "2014-03-13 21:38:30 -0700",
                                            37,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.211",
                                            source)
    CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/courses",
                                            "2015-03-12 21:38:00 -0800",
                                            37,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Safari/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.210",
                                            source)

       browers = ["Chrome", "Chrome", "Safari"]
       assert_equal browers, source.browsers
    end

    def test_it_can_return_platforms_for_source
        source = CreateSourcesAndPayloads.create_source("jumpstartlab", "http://www.jumpstartlab.com")
        CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/blog",
                                              "2014-02-16 21:38:28 -0700",
                                              37,
                                              "http://jumpstartlab.com",
                                              "GET",
                                              [],
                                              "socialLogin",
                                              "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                              "1920",
                                              "1280",
                                              "63.29.38.211",
                                              source)
        CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/courses",
                                              "2014-03-13 21:38:30 -0700",
                                              37,
                                              "http://jumpstartlab.com",
                                              "GET",
                                              [],
                                              "socialLogin",
                                              "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                              "1920",
                                              "1280",
                                              "63.29.38.211",
                                              source)
        CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/courses",
                                              "2015-03-12 21:38:00 -0800",
                                              37,
                                              "http://jumpstartlab.com",
                                              "GET",
                                              [],
                                              "socialLogin",
                                              "Mozilla/5.0 (Windows) AppleWebKit/537.17 (KHTML, like Gecko) Safari/24.0.1309.0 Safari/537.17",
                                              "1920",
                                              "1280",
                                              "63.29.38.210",
                                              source)

    platforms = ["Macintosh%3B Intel Mac OS X 10_8_2", "Macintosh%3B Intel Mac OS X 10_8_2", "Windows"]
    assert_equal platforms, source.platforms
  end

  def test_it_can_list_avg_response_times_for_urls
    TrafficSpy::Url.create(name: "http://jumpstartlab.com/blog")
    TrafficSpy::Url.create(name: "http://jumpstartlab.com/courses")

    url = TrafficSpy::Url.first
    url2 = TrafficSpy::Url.last

    source = CreateSourcesAndPayloads.create_source("jumpstartlab", "http://www.jumpstartlab.com")
    CreateSourcesAndPayloads.create_payload("#{url.name}",
                                            "2014-02-16 21:38:28 -0700",
                                            40,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.211",
                                            source)
    CreateSourcesAndPayloads.create_payload("#{url.name}",
                                            "2014-03-13 21:38:30 -0700",
                                            6,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.211",
                                            source)
    CreateSourcesAndPayloads.create_payload("#{url2.name}",
                                            "2015-03-12 21:38:00 -0800",
                                            6,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "960",
                                            "640",
                                            "63.29.38.210",
                                            source)

    CreateSourcesAndPayloads.create_payload("#{url2.name}",
                                            "2015-03-10 21:38:05 -0800",
                                            18,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1280",
                                            "720",
                                            "63.29.38.210",
                                            source)
    urls = ["http://jumpstartlab.com/blog: 23", "http://jumpstartlab.com/courses: 12"]
    assert_equal urls, source.ordered_url_response_times
  end

  def test_it_can_return_resolutions_for_source
    source = CreateSourcesAndPayloads.create_source("jumpstartlab", "http://www.jumpstartlab.com")
    CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/blog",
                                            "2014-02-16 21:38:28 -0700",
                                            37,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.211",
                                            source)
       resolutions = ["1920x1280"]
       assert_equal resolutions, source.resolutions
  end

  def test_it_can_return_url_objects_from_source
    source = CreateSourcesAndPayloads.create_source("jumpstartlab", "http://www.jumpstartlab.com")
    CreateSourcesAndPayloads.create_payload("http://jumpstartlab.com/blog",
                                            "2014-02-16 21:38:28 -0700",
                                            37,
                                            "http://jumpstartlab.com",
                                            "GET",
                                            [],
                                            "socialLogin",
                                            "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
                                            "1920",
                                            "1280",
                                            "63.29.38.211",
                                            source)
    assert_equal ["http://jumpstartlab.com/blog"], source.url_objects
  end
end