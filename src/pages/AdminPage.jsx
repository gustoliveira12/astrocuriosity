import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { supabase, isConfigured } from '../lib/supabase'

const TIPOS = [
  'Buraco Negro', 'Galáxia Espiral', 'Galáxias satélites anãs irregulares',
  'Estrela', 'Planeta Rochoso', 'Gigante Gasoso', 'Gigante de Gelo',
  'Planeta Anão', 'Satélite Natural', 'Cometa Periódico',
  'Cometa de Longo Período', 'Nebulosa de Emissão', 'Nebulosa Planetária',
  'Telescópio Espacial/Artificial',
]

const EMPTY = {
  titulo: '', descricao: '', tipo: '', caracteristicas: '', link: '', imagem: '', tags: '',
}

const fieldClass = 'w-full bg-slate-800 border border-slate-600 rounded-lg px-4 py-2.5 text-white placeholder-slate-500 focus:outline-none focus:border-sky-400 transition-colors'

function Field({ label, name, value, onChange, required, placeholder, hint }) {
  return (
    <div>
      <label className="block text-slate-400 text-sm mb-1">
        {label} {hint && <span className="text-slate-500 font-normal">{hint}</span>}
      </label>
      <input
        type="text"
        name={name}
        value={value}
        onChange={onChange}
        required={required}
        placeholder={placeholder}
        className={fieldClass}
      />
    </div>
  )
}

export default function AdminPage() {
  const [form, setForm]       = useState(EMPTY)
  const [loading, setLoading] = useState(false)
  const [feedback, setFeedback] = useState(null)
  const navigate = useNavigate()

  function handleChange(e) {
    setForm(prev => ({ ...prev, [e.target.name]: e.target.value }))
  }

  async function handleSubmit(e) {
    e.preventDefault()
    setLoading(true)
    setFeedback(null)

    if (!isConfigured || !supabase) {
      setFeedback({ type: 'error', message: 'Supabase não configurado. Preencha o arquivo .env.' })
      setLoading(false)
      return
    }

    const { error } = await supabase.from('celestial_objects').insert([form])

    if (error) {
      setFeedback({ type: 'error', message: error.message })
    } else {
      setFeedback({ type: 'success', message: `"${form.titulo}" adicionado com sucesso!` })
      setForm(EMPTY)
      window.scrollTo({ top: 0, behavior: 'smooth' })
    }
    setLoading(false)
  }

  async function handleLogout() {
    if (supabase) {
      await supabase.auth.signOut()
    }
    navigate('/')
  }

  return (
    <div className="min-h-screen bg-slate-950 text-white">
      {/* Header */}
      <header className="bg-slate-900 border-b border-slate-800 px-6 py-4 flex items-center justify-between sticky top-0 z-10">
        <div>
          <h1 className="font-bold text-lg">Admin</h1>
          <p className="text-slate-400 text-xs">AstroCuriosity</p>
        </div>
        <div className="flex items-center gap-4">
          <Link to="/" className="text-slate-400 hover:text-white text-sm transition-colors">
            ← Ver site
          </Link>
          <button
            onClick={handleLogout}
            className="text-slate-400 hover:text-red-400 text-sm transition-colors"
          >
            Sair
          </button>
        </div>
      </header>

      <main className="max-w-2xl mx-auto px-4 py-8">
        <h2 className="text-xl font-semibold text-white mb-6">Novo objeto celeste</h2>

        <form onSubmit={handleSubmit} className="space-y-5">
          <Field label="Título *" name="titulo" value={form.titulo} onChange={handleChange} required />

          {/* Tipo com datalist */}
          <div>
            <label className="block text-slate-400 text-sm mb-1">Tipo *</label>
            <input
              list="tipos-list"
              name="tipo"
              value={form.tipo}
              onChange={handleChange}
              required
              placeholder="Ex: Estrela, Buraco Negro..."
              className={fieldClass}
            />
            <datalist id="tipos-list">
              {TIPOS.map(t => <option key={t} value={t} />)}
            </datalist>
          </div>

          {/* Descrição */}
          <div>
            <label className="block text-slate-400 text-sm mb-1">Descrição *</label>
            <textarea
              name="descricao"
              value={form.descricao}
              onChange={handleChange}
              required
              rows={4}
              className={fieldClass + ' resize-none'}
            />
          </div>

          {/* Características */}
          <div>
            <label className="block text-slate-400 text-sm mb-1">
              Características <span className="text-slate-500">(separe com ponto e vírgula)</span>
            </label>
            <textarea
              name="caracteristicas"
              value={form.caracteristicas}
              onChange={handleChange}
              rows={3}
              placeholder="Ex: Massa solar 1,989 × 10³⁰ kg; Temperatura 5.778 K"
              className={fieldClass + ' resize-none'}
            />
          </div>

          <Field
            label="URL da imagem"
            name="imagem"
            value={form.imagem}
            onChange={handleChange}
            placeholder="/images/nome.jpg"
          />
          <Field
            label="Link (saiba mais)"
            name="link"
            value={form.link}
            onChange={handleChange}
            placeholder="https://..."
          />
          <Field
            label="Tags"
            name="tags"
            hint="(palavras-chave separadas por espaço)"
            value={form.tags}
            onChange={handleChange}
            placeholder="estrela sol sistema solar"
          />

          {feedback && (
            <div className={`rounded-xl p-4 text-sm border ${
              feedback.type === 'success'
                ? 'bg-emerald-900/30 border-emerald-700 text-emerald-300'
                : 'bg-red-900/30 border-red-700 text-red-300'
            }`}>
              {feedback.message}
            </div>
          )}

          <button
            type="submit"
            disabled={loading}
            className="w-full bg-sky-600 hover:bg-sky-500 disabled:opacity-50 disabled:cursor-not-allowed text-white font-semibold py-3 rounded-xl transition-colors"
          >
            {loading ? 'Salvando...' : 'Adicionar objeto'}
          </button>
        </form>
      </main>
    </div>
  )
}
