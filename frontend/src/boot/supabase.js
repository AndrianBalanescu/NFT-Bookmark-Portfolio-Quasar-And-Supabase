import { createClient } from '@supabase/supabase-js'
//require dotenv

const supabaseUrl = process.env.VUE_APP_SUPABASE_ANON_URL
const supabaseAnonKey = process.env.VUE_APP_SUPABASE_ANON_KEY

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
