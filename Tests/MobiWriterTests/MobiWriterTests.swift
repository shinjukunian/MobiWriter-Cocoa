import XCTest
@testable import MobiWriter

@available(OSX 10.12, *)
final class MobiWriterTests: XCTestCase {
    
    let HTML =
            """
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    </head>
    <body>
    <p class="p1"><span class="s1"><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>
    </body>
    </html>
    """
    
    let rubyHTML =
    """
<html>
<head>
<guide></guide>
</head>
<body>
<p class="p1"><span class="s1"><ruby>振り仮名<rt>ふ　がな</rt></ruby>（ふりがな）とは、<ruby>日本<rt style='font-size:6.0pt;layout-grid-mode:line'>にっぽん</rt></ruby><ruby>語<rt style='font-size:6.0pt;layout-grid-mode:line'>ご</rt></ruby>において、<ruby>文字<rt style='font-size:6.0pt;layout-grid-mode:line'>もじ</rt></ruby>（<ruby>主<rt style='font-size:6.0pt;layout-grid-mode:line'>おも</rt></ruby>に<ruby>漢字<rt style='font-size:6.0pt;layout-grid-mode:line'>かんじ</rt></ruby>）に<ruby>対<rt style='font-size:6.0pt;layout-grid-mode:line'>たい</rt></ruby>して、その<ruby>読<rt style='font-size:6.0pt;layout-grid-mode:line'>よ</rt></ruby>み<ruby>方<rt style='font-size:6.0pt;layout-grid-mode:line'>かた</rt></ruby>を<ruby>示<rt style='font-size:6.0pt;layout-grid-mode:line'>しめ</rt></ruby>すために、その<ruby>字<rt style='font-size:6.0pt;layout-grid-mode:line'>じ</rt></ruby>の<ruby>周<rt style='font-size:6.0pt;layout-grid-mode:line'>まわ</rt></ruby>りに<ruby>添<rt style='font-size:6.0pt;layout-grid-mode:line'>そ</rt></ruby>える<ruby>表音<rt style='font-size:6.0pt;layout-grid-mode:line'>ひょうおん</rt></ruby><ruby>文字<rt style='font-size:6.0pt;layout-grid-mode:line'>もじ</rt></ruby>である<ruby>仮名<rt style='font-size:6.0pt;layout-grid-mode:line'>かな</rt></ruby>[1]（<ruby>平仮名<rt style='font-size:6.0pt;layout-grid-mode:line'>ひらがな</rt></ruby>や<ruby>片仮名<rt style='font-size:6.0pt;layout-grid-mode:line'>かたかな</rt></ruby>）のことをいう。</span></p>
<p class="p1"><span class="s1"><ruby>活版<rt style='font-size:6.0pt;layout-grid-mode:line'>かっぱん</rt></ruby><ruby>印刷<rt style='font-size:6.0pt;layout-grid-mode:line'>いんさつ</rt></ruby>において、<ruby>基本<rt style='font-size:6.0pt;layout-grid-mode:line'>きほん</rt></ruby><ruby>的<rt style='font-size:6.0pt;layout-grid-mode:line'>てき</rt></ruby>な<ruby>本文<rt style='font-size:6.0pt;layout-grid-mode:line'>ほんぶん</rt></ruby>の<ruby>文字<rt style='font-size:6.0pt;layout-grid-mode:line'>もじ</rt></ruby>の<ruby>大<rt style='font-size:6.0pt;layout-grid-mode:line'>おお</rt></ruby>きさであった<ruby>五<rt style='font-size:6.0pt;layout-grid-mode:line'>ご</rt></ruby><ruby>号<rt style='font-size:6.0pt;layout-grid-mode:line'>ごう</rt></ruby><ruby>格<rt style='font-size:6.0pt;layout-grid-mode:line'>かく</rt></ruby>の<ruby>活字<rt style='font-size:6.0pt;layout-grid-mode:line'>かつじ</rt></ruby>に<ruby>対<rt style='font-size:6.0pt;layout-grid-mode:line'>たい</rt></ruby>して、<ruby>振り仮名<rt style='font-size:6.0pt;layout-grid-mode:line'>ふ　がな</rt></ruby>として<ruby>用<rt style='font-size:6.0pt;layout-grid-mode:line'>もち</rt></ruby>いた<ruby>七<rt style='font-size:6.0pt;layout-grid-mode:line'>なな</rt></ruby><ruby>号<rt style='font-size:6.0pt;layout-grid-mode:line'>ごう</rt></ruby><ruby>格<rt style='font-size:6.0pt;layout-grid-mode:line'>かく</rt></ruby>の<ruby>活字<rt style='font-size:6.0pt;layout-grid-mode:line'>かつじ</rt></ruby>が<ruby>別名<rt style='font-size:6.0pt;layout-grid-mode:line'>べつめい</rt></ruby>「ルビー（Ruby）」であったため、<ruby>印刷<rt style='font-size:6.0pt;layout-grid-mode:line'>いんさつ</rt></ruby><ruby>物<rt style='font-size:6.0pt;layout-grid-mode:line'>ぶつ</rt></ruby>の<ruby>振り仮名<rt style='font-size:6.0pt;layout-grid-mode:line'>ふ　がな</rt></ruby>を「ルビ」ともいう。</span></p>
</body>
</html>
"""
    
    var tempMobiURL:URL{
        return FileManager.default.temporaryDirectory.appendingPathComponent(NSUUID().uuidString).appendingPathExtension("mobi")

    }
    
    func testHTMLText() {
        
        guard let page=MobiPage(htmlString: rubyHTML) else{
            XCTFail("HTML saving failed")
            return
        }
        let writer=MobiExporter()
        writer.add(page)
        let success=writer.write(to: tempMobiURL)
        XCTAssertTrue(success)
    }
    
    func testHTMLFile(){
        let htmlURL=FileManager.default.temporaryDirectory.appendingPathComponent(NSUUID().uuidString).appendingPathExtension("html")
        do{
            try HTML.write(to: htmlURL, atomically: true, encoding: .utf8)
            let page=MobiPage(htmLatURL: htmlURL)
            let writer=MobiExporter()
            writer.add(page)
            let success=writer.write(to: tempMobiURL)
            XCTAssertTrue(success)
        }catch let error{
            XCTFail(error.localizedDescription)
        }
        
    }
    

    static var allTests = [
        ("testHTMLText", testHTMLFile),
    ]
}
