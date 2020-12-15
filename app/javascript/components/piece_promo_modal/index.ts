import Backbone from 'backbone'
import Mousetrap from 'mousetrap'
import Chess from 'chess.js'

import { dispatch, subscribe } from '@blitz/store'
import { FEN, ChessMove } from '@blitz/types'

import './style.sass'

/** When you make a pawn move that requires pawn promotion, this is what shows up */
export default class PiecePromotionModal extends Backbone.View {
  private fen: FEN
  private moveIntent: ChessMove
  private readonly cjs = new Chess

  private template(color: 'w'): string {
    const piecesHtml = ['q', 'r', 'n', 'b'].map((piece) => {
      return `
        <a class="piece" href="javascript:" data-piece="${piece}">
          <svg viewBox="0 0 45 45">
            <use xlink:href="#${color}${piece}" width="100%" height="100%"/>
          </svg>
        </a>
      `
    }).join('')
    return `
      <div class="piece-promotion-modal">
        <div class="prompt">
          Choose your destiny
        </div>
        <div class="pieces">${piecesHtml}</div>
      </div>
      <div class="background"></div>
    `
  }

  // @ts-ignore
  get el(): HTMLElement {
    return document.querySelector(`.piece-promotion-modal-container`)
  }

  events(): Backbone.EventsHash {
    return {
      'click .piece' : `_selectPiece`,
    }
  }

  initialize() {
    subscribe({
      'move:promotion': data => {
        this.fen = data.fen
        this.moveIntent = data.move
        this.show()
      }
    })
  }

  private show() {
    this.el.innerHTML = this.template('w')
    this.el.style.display = 'block'
    this.el.style.zIndex = '1000'
    Mousetrap.bind(`esc`, () => this.hide())
  }

  private hide() {
    this.el.style.display = `none`
    this.el.style.zIndex = '0'
    Mousetrap.unbind(`esc`)
  }

  private _selectPiece(e, childElement: HTMLElement) {
    const chosenPiece = childElement.dataset.piece
    const move: ChessMove = Object.assign({}, this.moveIntent, {
      promotion: chosenPiece
    })
    this.cjs.load(this.fen)
    const m = this.cjs.move(move)
    if (m) {
      dispatch(`move:try`, m)
    }
    this.hide()
  }
}
