import { useEffect, useRef } from 'react'

export default function CelestialModal({ object, onClose }) {
  const closeRef = useRef(null)

  useEffect(() => {
    closeRef.current?.focus()
    document.body.style.overflow = 'hidden'

    const handler = e => { if (e.key === 'Escape') onClose() }
    window.addEventListener('keydown', handler)

    return () => {
      document.body.style.overflow = ''
      window.removeEventListener('keydown', handler)
    }
  }, [onClose])

  const characteristics = object.caracteristicas
    ? object.caracteristicas.split(';').map(s => s.trim()).filter(Boolean)
    : []

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center p-4"
      style={{ backgroundColor: 'rgba(2, 6, 23, 0.88)' }}
      onClick={onClose}
    >
      <div
        role="dialog"
        aria-modal="true"
        aria-labelledby="modal-title"
        className="bg-slate-900 border border-slate-700 rounded-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto shadow-2xl"
        onClick={e => e.stopPropagation()}
      >
        {/* Hero image */}
        <div className="relative h-56 sm:h-64 overflow-hidden rounded-t-2xl flex-shrink-0">
          <img
            src={object.imagem}
            alt={object.titulo}
            className="w-full h-full object-cover"
            onError={e => { e.currentTarget.src = '/images/background.jpg' }}
          />
          <div className="absolute inset-0 bg-gradient-to-t from-slate-900/90 via-slate-900/20 to-transparent" />
          <button
            ref={closeRef}
            onClick={onClose}
            aria-label="Fechar"
            className="absolute top-4 right-4 bg-slate-900/70 backdrop-blur-sm text-white w-9 h-9 rounded-full flex items-center justify-center hover:bg-slate-700 transition-colors text-base leading-none"
          >
            ✕
          </button>
        </div>

        {/* Content */}
        <div className="p-6">
          <span className="inline-block bg-sky-500/15 border border-sky-500/30 text-sky-300 text-xs font-medium px-3 py-1 rounded-full mb-3">
            {object.tipo}
          </span>

          <h2 id="modal-title" className="text-2xl sm:text-3xl font-bold text-white mb-4">
            {object.titulo}
          </h2>

          <p className="text-slate-300 leading-relaxed mb-5">{object.descricao}</p>

          {characteristics.length > 0 && (
            <div className="bg-slate-800/60 rounded-xl p-4 mb-5">
              <h3 className="text-sky-400 text-xs font-semibold uppercase tracking-widest mb-3">
                Características
              </h3>
              <ul className="space-y-2">
                {characteristics.map((c, i) => (
                  <li key={i} className="flex gap-2 text-slate-300 text-sm">
                    <span className="text-sky-500 mt-0.5 flex-shrink-0">▸</span>
                    <span>{c}</span>
                  </li>
                ))}
              </ul>
            </div>
          )}

          {object.link && (
            <a
              href={object.link}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-2 bg-sky-600 hover:bg-sky-500 active:bg-sky-700 text-white font-medium px-6 py-2.5 rounded-full transition-colors text-sm"
            >
              Saiba mais <span aria-hidden="true">→</span>
            </a>
          )}
        </div>
      </div>
    </div>
  )
}
