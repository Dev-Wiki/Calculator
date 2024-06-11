import { CalculateView } from './calculate/CalculatePage';
import { ConvertView, ConvertViewModel } from './convert/ConvertPage';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  @Provide convertViewModel: ConvertViewModel = new ConvertViewModel();

  aboutToAppear(): void {
    this.convertViewModel.requestRefreshHome = () =>{
      // 这里处理 Home的 逻辑调用
    }
  }

  onPageShow(): void {
    this.convertViewModel.onPageShow();
  }

  build() {

    Column() {
      Stack({ alignContent: Alignment.TopEnd}) {
        Tabs({ barPosition: BarPosition.Start}) {
          TabContent() {
            CalculateView();
          }
          .tabBar($r("app.string.calculate"))

          TabContent() {
            ConvertView();
          }
          .tabBar($r("app.string.convert"))
        }
      }
    }
    .height('100%').width('100%')
  }
}