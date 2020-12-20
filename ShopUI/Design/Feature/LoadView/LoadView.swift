import SwiftUI

struct LoadView : View {
    var body: some View {
        UIShopAnimation()
    }
}

struct UIShopAnimation: View {
    @State private var titlePercentage: CGFloat = .zero
    @State private var subtitlePercentage: CGFloat = .zero
    @State var selectionView: Int? = nil
    
    var productListViewModel = ProductListViewModelImplementation()
    @State var isContinueButtonDisabled: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    VStack {
                        Title(titlePercentage: $titlePercentage,
                              color: .white)
                            .offset(y:20)
                        Subtitle(subtitlePercentage: $subtitlePercentage,
                                 subtitleColor: .white)
                            .offset(y:10)
                    }
                    .background(Image("loadViewTexture"))
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                }
                Spacer()
                ContinueButton(selectionView: $selectionView,
                               isContinueButtonDisabled: isContinueButtonDisabled)
                    .disabled(isContinueButtonDisabled)
            
                NavigationLink(
                    destination: ProductListView(productListViewModel: productListViewModel),
                    tag: 1,
                    selection: $selectionView ,
                    label: {}
                )
            }
            .onAppear() {
                productListViewModel.getProductList()
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    isContinueButtonDisabled = false
                }
            }
        }
    }
}

struct LoadViewButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(width: 200, height: 50)
            .foregroundColor(configuration.isPressed ? .gray : .accentColor)
            .background(Image("loadViewTexture"))
            .cornerRadius(20)
    }
}

struct Title: View {
    @Binding var titlePercentage: CGFloat
    
    var color: Color
    
    var body: some View {
        HStack {
            LetterU()
                .trim(from: 0, to: titlePercentage)
                .stroke(color,
                        style: StrokeStyle(lineWidth: 12,
                                           lineCap: .round,
                                           lineJoin: .round))
                .offset(x: 50)
            LetterI()
                .trim(from: 0, to: titlePercentage)
                .stroke(color,
                        style: StrokeStyle(lineWidth: 12,
                                           lineCap: .round,
                                           lineJoin: .round))
                
        }
        .frame(width: 200, height: 100)
        .onAppear(perform: {
            DispatchQueue.main.async {
                withAnimation(Animation.easeOut(duration: 2.0)){
                    titlePercentage = 1.0
                }
            }
        })
    }
}

struct Subtitle: View {
    @Binding var subtitlePercentage: CGFloat
    
    var subtitleColor: Color
    
    var body: some View {
        HStack {
            LetterS()
                .trim(from: 0, to: subtitlePercentage)
                .stroke(subtitleColor,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .offset(x: 50)
              LetterH()
                .trim(from: 0, to: subtitlePercentage)
                .stroke(subtitleColor,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .offset(x: 25, y: 0)
            LetterO()
                .trim(from: 0, to: subtitlePercentage)
                .stroke(subtitleColor,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .offset(x: 2, y: 0)
            LetterP()
                .trim(from: 0, to: subtitlePercentage)
                .stroke(subtitleColor,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .offset(x: -15)
        }
        .frame(width: 200, height: 50, alignment: .center)
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                withAnimation(Animation.easeOut(duration: 2.0)){
                    subtitlePercentage = 1.0
                }
            })
        })
        
    }
}

struct ContinueButton: View {
    @Binding var selectionView: Int?
    var isContinueButtonDisabled: Bool
    
    var body: some View {
        if isContinueButtonDisabled {
            Button(action: {},
                   label: { Text("") })
                
        } else {
            Button(action: {
                self.selectionView = 1
            }, label: {
                Text("Continue")
            }).modifier(CustomButton())
        }
    }
}

struct CustomButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Image("loadViewTexture"))
            .cornerRadius(20)
    }
}
