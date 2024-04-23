<img src="https://github.com/xAxis47/ZBSlider/assets/140302470/edc48fba-878c-4ed6-9254-ebf9ce10fced" width="300">

ZBSlider can express below 0 value. It is written in SwiftUI.

# Installation
## Cocoapods

pod “ZBSlider”

# Usage

Import the framework.

```
import ZeroBaseSlider
```

Make ZeroBaseSlider and must fill “thumbValue”.

```
import SwiftUI

struct ContentView: View {

  @State var thumbValue: Double = 0

  var body: some View {

    ZBSlider(thumbValue: $thumbValue)

  }

}
```

If you need you can change appearance with some modifier.

```
      .isHideLimitValue(_ bool:)
      .isHideThumbValue(_ bool:)
      .isIntThumb(_ bool:)
      .isSmoothDrag(_ bool:)
      .limitValueOffset(_ offset:)
      .maxValueColor(_ color:)
      .maxValueFont(_ font:)
      .maxValueFontWeight(_ weight:)
      .minValueColor(_ color:)
      .minValueFont(_ font:)
      .minValueFontWeight(_ weight:)
      .sliderColor(_ color:)
      .thumbColor(_ color:)
      .thumbValueColor(_ color:)
      .thumbValueFont(_ font:)
      .thumbValueFontWeight(_ weight:)
      .valueColor(_ color:)
```

# Untested

The library is basically untested. Please report bugs via the issue tracker on GitHub.

# License

Licensed under the Apache License 2.0. See the LICENSE file for more information.

Thanks!
