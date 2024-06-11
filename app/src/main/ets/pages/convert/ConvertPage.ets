import { ConvertItem } from '../../bean/ConvertItem'
import { Res } from '../../utils/Res';
import { RoutePath } from '../../utils/RoutePath';

export class ConvertViewModel {

  requestRefreshHome?: ()=> void;

  convertItems: ConvertItem[] = [
    { icon: Res.getImage('ic_length'), name: Res.getString('length_convert'), page: RoutePath.LengthPage },
    { icon: Res.getImage('ic_weight'), name: Res.getString('weight_convert'), page: RoutePath.WeightPage },
    { icon: Res.getImage('ic_area'), name: Res.getString('area_convert'), page: RoutePath.AreaPage },
    { icon: Res.getImage('ic_number'), name: Res.getString('number_convert'), page: RoutePath.AreaPage },
    { icon: Res.getImage('ic_speed'), name: Res.getString('speed_convert'), page: RoutePath.AreaPage },
    { icon: Res.getImage('ic_bmi'), name: Res.getString('bmi_calculate'), page: RoutePath.AreaPage },
    { icon: Res.getImage('ic_time'), name: Res.getString('time_convert'), page: RoutePath.TimePage },
  ];

  refresh() {

  }

  onPageShow() {

  }
}

@Preview
@Component
export struct ConvertView {
  @Consume convertViewModel: ConvertViewModel;
  scroller: Scroller = new Scroller();

  build() {
    Column() {
      Grid(this.scroller) {
        ForEach(this.convertViewModel.convertItems, (item: ConvertItem, index) => {
          GridItem() {
            ConvertItemView({ item: item })
          }
          .rowStart(index / 3)
          .columnStart(index % 3)
        })
      }.columnsTemplate('1fr 1fr 1fr')
      .width('100%').rowsGap(20).columnsGap(20)
    }.width('100%').height('100%').padding(8)
  }
}

@Component
struct ConvertItemView {
  @Prop item: ConvertItem

  build() {
    Button() {
      Column() {
        Image(this.item.icon).width(32).height(32).objectFit(ImageFit.Contain)

        Text(this.item.name).margin({ top: 8 })
      }
      .width(100)
      .height(100)
      .borderWidth(1)
      .borderColor('#eeeeee')
      .justifyContent(FlexAlign.Center)
    }.type(ButtonType.Normal).backgroundColor(Color.Transparent)
    .onClick(() => {
      this.getUIContext().getRouter().pushUrl({ url: this.item.page })
    })
  }
}