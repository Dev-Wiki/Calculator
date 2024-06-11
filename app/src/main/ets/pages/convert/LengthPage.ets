import { TitleBar } from '../../component/TitleBar'
import { Res } from '../../utils/Res';

@Entry
@Component
export struct LengthPage {

  build() {
    Column(){
      TitleBar({title: Res.getString('length_convert')});
    }.height('100%').width('100%')
  }
}