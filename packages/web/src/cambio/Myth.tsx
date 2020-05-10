import * as React from 'react'
import { useInView } from 'react-intersection-observer'
import { StyleSheet, Text, View } from 'react-native'
import BusToken from 'src/cambio/BusToken'
import Magazine from 'src/cambio/Magazine'
import Bridge from 'src/cambio/myth/01.jpg'
import Guy from 'src/cambio/myth/02.jpg'
import Truck from 'src/cambio/myth/03.jpg'
import BridgeMobile from 'src/cambio/myth/bridge-mobile.jpg'
import GuyMobile from 'src/cambio/myth/guy-mobile.jpg'
import TruckSmall from 'src/cambio/myth/truck-mobile.jpg'
import { colors, stdStyles } from 'src/cambio/standards'
import { H1, H2, H4 } from 'src/fonts/Fonts'
import { NameSpaces, useTranslation } from 'src/i18n'
import { Cell, GridRow, Spans } from 'src/layout/GridRow'
import { useScreenSize } from 'src/layout/ScreenSize'
import { fonts, standardStyles, textStyles } from 'src/styles'

const threshold = [0.1, 0.5]

export default function Myth() {
  const { t } = useTranslation(NameSpaces.cambio)
  const { isMobile } = useScreenSize()
  const [ref, inView] = useInView({ threshold: 0.2 })
  const [ref2, inView2] = useInView({ threshold })
  return (
    <>
      <View style={[styles.root, inView || inView2 ? styles.inView : styles.outOfView]} />
      <div ref={ref}>
        <GridRow desktopStyle={standardStyles.centered} mobileStyle={stdStyles.fullScreen}>
          <Cell span={Spans.half}>
            <BusToken color={colors.lightest} size={44} />
            <H1 style={[standardStyles.elementalMarginTop, textStyles.invert]}>{t('mythTitle')}</H1>
            <H4 style={[standardStyles.elementalMargin, textStyles.invert]}>{t('mythSubTitle')}</H4>
          </Cell>
        </GridRow>
      </div>
      <Magazine source={isMobile ? BridgeMobile : Bridge} align="left">
        <H2
          style={[
            standardStyles.elementalMarginBottom,
            standardStyles.blockMarginTopMobile,
            textStyles.invert,
          ]}
        >
          The Myth
        </H2>
        <Text style={[fonts.p, textStyles.invert, styles.firstParagraph]}>
          In the 1970s here the streets overflowed with rubbish. The roads that passed through
          favelas were not wide enough for garbage trucks to go through, so the litter accumulated
          on the streets, in the river, and in the fields on the outskirts of the favelas.
        </Text>
        <Paragraph>
          At the same time the local bus system had seen rapid development. And this had created
          excess capacity on buses.
        </Paragraph>
      </Magazine>
      <Magazine source={isMobile ? GuyMobile : Guy} align="right">
        <Paragraph>
          Government representatives then agreed to compensate locals to clean up garbage — and pay
          them with bus tokens. For every pound of garbage collected, one bus token was rewarded.
        </Paragraph>
        <Paragraph>
          Local people simply needed to weigh the garbage that they’d picked — a kind of
          proof-of-collection — and they’d receive their reward.
        </Paragraph>
      </Magazine>
      <Magazine source={isMobile ? TruckSmall : Truck} align="left">
        <Paragraph>
          They were, in effect, a new currency, with many properties we believe in for the future of
          currencies: earned into existence, backed by underutilized resources, issued independently
          alongside federal currency, and reducing the monetary system’s dependence on debt.
        </Paragraph>
      </Magazine>
      <div ref={ref2}>
        <View style={styles.finalContainer}>
          <GridRow>
            <Cell span={Spans.half}>
              <Text style={[fonts.h4, textStyles.invert, styles.final]}>
                We can imagine many future forms of value exactly like this with Celo.
              </Text>
            </Cell>
          </GridRow>
        </View>
      </div>
    </>
  )
}

function Paragraph({ children }) {
  return <Text style={[fonts.p, textStyles.invert, styles.paragraph]}>{children}</Text>
}

const styles = StyleSheet.create({
  root: {
    transitionProperty: 'opacity',
    transitionDuration: '500ms',
    width: '100vw',
    height: '100vh',
    position: 'fixed',
    zIndex: -10,
    backgroundColor: colors.darkest,
  },
  outOfView: {
    opacity: 0,
  },
  inView: {
    opacity: 1,
  },
  firstParagraph: {
    marginBottom: '40vh',
  },
  paragraph: {
    paddingTop: '60vh',
    paddingBottom: '10vh',
  },
  final: {
    paddingTop: '70vh',
    paddingBottom: 0,
  },
  finalContainer: { zIndex: 55 },
})