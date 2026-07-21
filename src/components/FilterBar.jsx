const CHIP_COLORS = {
  'Todos':          'bg-sky-500 text-white',
  'Buracos Negros': 'bg-purple-700 text-white',
  'Galáxias':       'bg-indigo-600 text-white',
  'Estrelas':       'bg-yellow-500 text-slate-900',
  'Planetas':       'bg-blue-600 text-white',
  'Cometas':        'bg-emerald-600 text-white',
  'Luas':           'bg-slate-500 text-white',
  'Nebulosas':      'bg-pink-600 text-white',
  'Telescópios':    'bg-orange-500 text-white',
}

export default function FilterBar({ categories, active, onSelect }) {
  return (
    <div className="flex flex-wrap gap-2 mb-8 justify-center">
      {categories.map(cat => {
        const isActive = active === cat.label
        const activeClass = CHIP_COLORS[cat.label] ?? 'bg-sky-500 text-white'
        return (
          <button
            key={cat.label}
            onClick={() => onSelect(cat.label)}
            className={`px-4 py-1.5 rounded-full text-sm font-medium transition-all duration-150 ${
              isActive
                ? `${activeClass} scale-105 shadow-lg`
                : 'bg-slate-700/60 text-slate-300 hover:bg-slate-600/60 border border-slate-600'
            }`}
          >
            {cat.label}
          </button>
        )
      })}
    </div>
  )
}
