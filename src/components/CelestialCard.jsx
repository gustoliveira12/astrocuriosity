export default function CelestialCard({ object, onSelect }) {
  return (
    <div
      onClick={() => onSelect(object)}
      className="group bg-slate-800/50 backdrop-blur-sm border border-slate-700 rounded-xl overflow-hidden cursor-pointer hover:border-sky-500 hover:shadow-xl hover:shadow-sky-500/10 transition-all duration-200 hover:-translate-y-1"
    >
      {/* Image */}
      <div className="relative h-44 overflow-hidden">
        <img
          src={object.imagem}
          alt={object.titulo}
          className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
          onError={e => { e.currentTarget.src = '/images/background.jpg' }}
        />
        <div className="absolute inset-0 bg-gradient-to-t from-slate-900/80 to-transparent" />
        <span className="absolute bottom-2 left-3 bg-sky-500/20 border border-sky-500/40 text-sky-300 text-xs px-2 py-0.5 rounded-full backdrop-blur-sm">
          {object.tipo}
        </span>
      </div>

      {/* Body */}
      <div className="p-4">
        <h3 className="font-semibold text-white text-base mb-1.5 group-hover:text-sky-300 transition-colors line-clamp-1">
          {object.titulo}
        </h3>
        <p className="text-slate-400 text-sm leading-relaxed line-clamp-3">
          {object.descricao}
        </p>
      </div>
    </div>
  )
}
