import SwiftUI

public struct PlusMinusSlider: View {
    
    @State var thumbPosition: Double = 0
    @State var leftBarPosition: Double = 0
    @State var zeroPosition: Double = 0
    
    @State var valueWidth: Double = 0
    
    @Binding var thumbValue: Double
    
    private let barWidth: CGFloat
    private let isHideLimitValue: Bool
    private let isHideThumbValue: Bool
    private let isIntThumb: Bool
    private let isSmoothDrag: Bool
    private let limitValueOffset: CGFloat
    private let max: Double
    private let maxValueColor: Color
    private let maxValueFont: Font
    private let min: Double
    private let minValueColor: Color
    private let minValueFont: Font
    private let sliderColor: Color
    private let thumbColor: Color
    private let thumbValueColor: Color
    private let thumbValueFont: Font
    private let valueColor: Color
    
    private let maxValue: Double
    private let minValue: Double
    
    public init(barWidth: Double = UIScreen.main.bounds.width * 0.65, max: Double = 5, min: Double = -5, thumbValue: Binding<Double>) {
        
        self.barWidth = barWidth
        self.isHideLimitValue = false
        self.isHideThumbValue = false
        self.isIntThumb = false
        self.isSmoothDrag = false
        self.limitValueOffset = 10
        self.max = max
        self.maxValueColor = Color.primary
        self.maxValueFont = .body
        self.min = min
        self.minValueColor = Color.primary
        self.minValueFont = .body
        self.sliderColor = Color(.systemGray5)
        self.thumbColor = Color(.systemGray)
        self.thumbValueColor = Color.primary
        self.thumbValueFont = .body
        self.valueColor = Color.blue
        
        self.maxValue = max
        self.minValue = min
        
        self._thumbValue = thumbValue
        
        let initialized = initialOperation(min: min, max: max, thumbValue: thumbValue)
        
        self._thumbPosition = initialized.thumbPosition
        self._zeroPosition = initialized.zeroPosition
        self._leftBarPosition = initialized.leftBarPosition
        self._valueWidth = initialized.valueWidth
        
    }
    
    public var body: some View {
        
        VStack {
            
            HStack {
                
                if !isHideLimitValue {
                    
                    Text("\(Int(minValue))")
                        .font(minValueFont)
                        .foregroundColor(minValueColor)
                        .offset(x: limitValueOffset * -1)
                    
                }
                
                ZStack(alignment: .leading) {
            
                    Capsule()
                        .frame(width: barWidth, height: 5)
                        .foregroundColor(sliderColor)
                    
                    Capsule()
                        .frame(width: valueWidth, height: 5)
                        .foregroundColor(valueColor)
                        .offset(x: leftBarPosition)
                    
                    if isIntThumb && !isHideThumbValue {
                        
                        Text("\(Int(thumbValue))")
                            .fixedSize(horizontal: true, vertical: false)
                            .font(thumbValueFont)
                            .foregroundColor(thumbValueColor)
                            .frame(width: 12, height: 12, alignment: .center)
                            .offset(x: -6, y: -30)
                            .offset(x: thumbPosition)
                        
                    } else if !isIntThumb && !isHideThumbValue {
                        
                        Text("\(Double(thumbValue))")
                            .fixedSize(horizontal: true, vertical: false)
                            .font(thumbValueFont)
                            .foregroundColor(thumbValueColor)
                            .frame(width: 12, height: 12, alignment: .center)
                            .offset(x: -6, y: -30)
                            .offset(x: thumbPosition)
                        
                    }
                    
                    Capsule()
                        .frame(width: 20, height: 20)
                        .foregroundColor(thumbColor)
                        .offset(x: -10)
                        .offset(x: thumbPosition)
                        .gesture(
                            
                            DragGesture()
                            
                                .onChanged { value in
                                    
                                    if value.location.x >= 0 && value.location.x <= barWidth {
                                        
                                        let sliderValue: Double
                                        
                                        if isSmoothDrag {
                                            
                                            self.thumbPosition = (Double(value.location.x / barWidth * (maxValue - minValue))) * barWidth / (maxValue - minValue)
                                            
                                            sliderValue = ((Double(self.thumbPosition / barWidth)) * (maxValue - minValue)) + minValue
                    
                                            self.thumbValue = sliderValue
                                            
                                        } else {
                                            
                                            self.thumbPosition = round(Double(value.location.x / barWidth * (maxValue - minValue))) * barWidth / (maxValue - minValue)
                                            
                                            sliderValue = round((Double(self.thumbPosition / barWidth)) * (maxValue - minValue)) + minValue
                                            
                                            self.thumbValue = round(sliderValue)
                                            
                                        }
                                        
                                        let width = self.thumbPosition - self.zeroPosition
                                        
                                        if width >= 0 {
                                            
                                            self.valueWidth = width
                                            self.leftBarPosition = self.zeroPosition
                                            
                                        } else if width < 0 {
                                            
                                            self.valueWidth = fabs(width)
                                            self.leftBarPosition = CGFloat(barWidth / (maxValue - minValue) * (sliderValue - minValue))

                                        }
                                        
                                    }
                                    
                                }
                                .onEnded { value in
                                    
                                    if value.location.x >= 0 && value.location.x <= barWidth {
                                        
                                        let sliderValue: Double
                                        
                                        if isSmoothDrag {
                                            
                                            self.thumbPosition = (Double(value.location.x / barWidth * (maxValue - minValue))) * barWidth / (maxValue - minValue)
                                            
                                            sliderValue = ((Double(self.thumbPosition / barWidth)) * (maxValue - minValue)) + minValue
                                            
                                            self.thumbValue = sliderValue
                                            
                                        } else {
                                            
                                            self.thumbPosition = round(Double(value.location.x / barWidth * (maxValue - minValue))) * barWidth / (maxValue - minValue)
                                            
                                            sliderValue = round((Double(self.thumbPosition / barWidth)) * (maxValue - minValue)) + minValue
                                            
                                            
                                            self.thumbValue = round(sliderValue)
                                            
                                        }
                                        
                                        let width = self.thumbPosition - self.zeroPosition
                                        
                                        if width >= 0 {
                                            
                                            self.valueWidth = width
                                            self.leftBarPosition = self.zeroPosition
                                            
                                        } else if width < 0 {
                                            
                                            self.valueWidth = fabs(width)
                                            self.leftBarPosition = CGFloat(barWidth / (maxValue - minValue) * (sliderValue - minValue))
                                            
                                        }
                                        
                                    }
                                    
                                }
                            
                        )
                    
                }
                
                if !isHideLimitValue {
                    
                    Text("\(Int(maxValue))")
                        .font(maxValueFont)
                        .foregroundColor(maxValueColor)
                        .offset(x: limitValueOffset)
                    
                }
                
            }
            
        }
        
    }
    
}

public extension PlusMinusSlider {
    
    private init(max: Double, min: Double, thumbValue: Binding<Double>, barWidth: CGFloat, isHideLimitValue: Bool, isHideThumbValue: Bool, isIntThumb: Bool, isSmoothDrag: Bool,  limitValueOffset: CGFloat, maxValueColor: Color, maxValueFont: Font,  minValueColor: Color, minValueFont: Font, sliderColor: Color, thumbColor: Color, thumbValueColor: Color, thumbValueFont: Font, valueColor: Color) {
        
        self.barWidth = barWidth
        self.isHideLimitValue = isHideLimitValue
        self.isHideThumbValue = isHideThumbValue
        self.isIntThumb = isIntThumb
        self.isSmoothDrag = isSmoothDrag
        self.limitValueOffset = limitValueOffset
        self.maxValueColor = maxValueColor
        self.maxValueFont = maxValueFont
        self.minValueColor = minValueColor
        self.minValueFont = minValueFont
        self.sliderColor = sliderColor
        self.thumbColor = thumbColor
        self.thumbValueColor = thumbValueColor
        self.thumbValueFont = thumbValueFont
        self.valueColor = valueColor
        
        self.max = max
        self.min = min
        
        self.maxValue = max
        self.minValue = min
        
        self._thumbValue = thumbValue
        
        let initialized = initialOperation(min: min, max: max, thumbValue: thumbValue)
        
        self._thumbPosition = initialized.thumbPosition
        self._zeroPosition = initialized.zeroPosition
        self._leftBarPosition = initialized.leftBarPosition
        self._valueWidth = initialized.valueWidth
        
    }

    func isHideLimitValue(_ bool: Bool) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: bool, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor, thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)

    }
    
    func isHideThumbValue(_ bool: Bool) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: bool, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor, thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)

    }
    
    func isIntThumb(_ bool: Bool) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: bool, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor, thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)

    }
    
    func isSmoothDrag(_ bool: Bool) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: bool, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor, thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)

    }
    
    func limitValueOffset(_ offset: CGFloat) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min,  thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: offset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor,  thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor:  self.valueColor)
        
    }
    
    func maxValueColor(_ color: Color) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: color, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor, thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)

    }
    
    func maxValueFont(_ font: Font) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min,  thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: font, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor,  thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)
        
    }
    
    func maxValueFontWeight(_ weight: Font.Weight) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: self.barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor, thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)

    }
    
    func minValueColor(_ color: Color) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min,  thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: color, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor,  thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)
        
    }
    
    func minValueFont(_ font: Font) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min,  thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: font, sliderColor: self.sliderColor, thumbColor: self.thumbColor,  thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)
        
    }
    
    func minValueFontWeight(_ weight: Font.Weight) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: self.barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor, thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)

    }

    func sliderColor(_ color: Color) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: self.barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: color, thumbColor: self.thumbColor, thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor:  self.valueColor)
        
    }
    
    func thumbColor(_ color: Color) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: self.barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: color, thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)
        
    }
    
    func thumbValueColor(_ color: Color) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: self.barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor, thumbValueColor: color, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)
        
    }
    
    func thumbValueFont(_ font: Font) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor, thumbValueColor: self.thumbValueColor, thumbValueFont: font, valueColor: self.valueColor)
        
    }
    
    func thumbValueFontWeight(_ weight: Font.Weight) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor, thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: self.valueColor)

    }
    
    func valueColor(_ color: Color) -> Self {
        
        PlusMinusSlider(max: self.max, min: self.min, thumbValue: self._thumbValue, barWidth: barWidth, isHideLimitValue: self.isHideLimitValue, isHideThumbValue: self.isHideThumbValue, isIntThumb: self.isIntThumb, isSmoothDrag: self.isSmoothDrag, limitValueOffset: self.limitValueOffset, maxValueColor: self.maxValueColor, maxValueFont: self.maxValueFont, minValueColor: self.minValueColor, minValueFont: self.minValueFont, sliderColor: self.sliderColor, thumbColor: self.thumbColor, thumbValueColor: self.thumbValueColor, thumbValueFont: self.thumbValueFont, valueColor: color)
        
    }
    
    private func initialOperation(min: Double, max: Double, thumbValue: Binding<Double>) -> (thumbPosition: State<Double>, zeroPosition: State<Double>, leftBarPosition: State<Double>, valueWidth: State<Double>) {
        
        let thumbPosition: State<Double>
        let zeroPosition: State<Double>
        let leftBarPosition: State<Double>
        let valueWidth: State<Double>

        thumbPosition = State(initialValue: Double(barWidth / (max - min) * (thumbValue.wrappedValue - min)))
        
        if min <= 0 && max >= 0 && thumbValue.wrappedValue <= 0 {

            zeroPosition = State(initialValue: Double(barWidth / (max - min) * -min))
            leftBarPosition = State(initialValue: Double(barWidth / (max - min) * (thumbValue.wrappedValue - min)))
            valueWidth = State(initialValue: Double(fabs(barWidth / (max - min) * thumbValue.wrappedValue)))
//            self.condition = 1
            
        } else if min <= 0 && max <= 0 && thumbValue.wrappedValue <= 0 {
            
            zeroPosition = State(initialValue: Double(barWidth))
            leftBarPosition = State(initialValue: Double(barWidth / (max - min) * (thumbValue.wrappedValue - min)))
            valueWidth = State(initialValue: Double(fabs(barWidth / (max - min) * (thumbValue.wrappedValue - max))))
//            self.condition = 2
            
        } else if min <= 0 && max >= 0 && thumbValue.wrappedValue >= 0  {

            zeroPosition = State(initialValue: Double(barWidth / (max - min) * -min))
            leftBarPosition = State(initialValue: Double(barWidth / (max - min) * -min))
            valueWidth = State(initialValue: Double(fabs(barWidth / (max - min) * thumbValue.wrappedValue)))

        } else if min >= 0 && max >= 0 && thumbValue.wrappedValue >= 0 {

            zeroPosition = State(initialValue: Double(0))
            leftBarPosition = State(initialValue: Double(0))
            valueWidth = State(initialValue: Double(barWidth / (max - min) * (thumbValue.wrappedValue - min)))

        } else {
            
            zeroPosition = State(initialValue: Double(0))
            leftBarPosition = State(initialValue: Double(0))
            valueWidth = State(initialValue: Double(0))

        }
        
        return (thumbPosition: thumbPosition, zeroPosition: zeroPosition, leftBarPosition: leftBarPosition, valueWidth: valueWidth)
        
    }
    
}
